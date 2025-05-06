#!/bin/bash

# Путь к лог-файлу
LOG_FILE="/var/log/first_script_setup.log"

# Создаём лог-файл (если можно)
touch "$LOG_FILE" || {
    echo "❌ Не удалось создать лог-файл $LOG_FILE. Проверьте права." >&2
    exit 1
}

# Запускаем логирование всего вывода (stdout и stderr)
exec > >(tee -a "$LOG_FILE") 2>&1

echo "📌 Лог запуска: $(date)"
echo "----------------------------------------"

# Обновление системы без замены конфигурационных файлов
apt update && apt upgrade -y"

# Ввод данных
read -p "Введите новый SSH-порт: " ssh_port
read -p "Введите имя пользователя: " username
read -s -p "Введите пароль для $username: " userpass
echo

# Проверка, существует ли пользователь
if id "$username" &>/dev/null; then
    echo "❌ Пользователь '$username' уже существует."
    exit 1
fi

# Создание пользователя
adduser --disabled-password --gecos "" "$username"
echo "$username:$userpass" | chpasswd
usermod -aG sudo "$username"
echo "✅ Пользователь '$username' создан и добавлен в sudo."

# Настройка SSH-ключей
mkdir -p /home/"$username"/.ssh
wget -qO /home/"$username"/.ssh/authorized_keys https://raw.githubusercontent.com/bfgexer/sh-scripts/refs/heads/main/scripts/authorized_keys
chown -R "$username":"$username" /home/"$username"/.ssh
chmod 700 /home/"$username"/.ssh
chmod 600 /home/"$username"/.ssh/authorized_keys
echo "🔐 Публичный ключ добавлен в /home/$username/.ssh/authorized_keys"

# Настройка sshd_config
sshd_config="/etc/ssh/sshd_config"

# Установка порта
sed -i "s/^#\?Port .*/Port $ssh_port/" "$sshd_config"

# Отключение root-доступа
sed -i "s/^#\?PermitRootLogin .*/PermitRootLogin no/" "$sshd_config"

# Отключение входа по паролю
if grep -qE "^\s*#?\s*PasswordAuthentication" "$sshd_config"; then
    sed -i "s|^\s*#\?\s*PasswordAuthentication.*|PasswordAuthentication no|" "$sshd_config"
else
    echo "PasswordAuthentication no" >> "$sshd_config"
fi

# Включение входа по ключу
if grep -qE "^\s*#?\s*PubkeyAuthentication" "$sshd_config"; then
    sed -i "s|^\s*#\?\s*PubkeyAuthentication.*|PubkeyAuthentication yes|" "$sshd_config"
else
    echo "PubkeyAuthentication yes" >> "$sshd_config"
fi

# Перезапуск SSH
systemctl restart ssh && echo "🔁 SSH перезапущен."

# Завершение
echo -e "\n✅ Готово! Используй порт $ssh_port и логин '$username' для входа по SSH через ключ."
echo "📄 Лог сохранён: $LOG_FILE"

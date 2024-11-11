#!/bin/bash

# Функция для вывода списка пользователей
list_users() {
    cut -d: -f1,6 /etc/passwd | sort
}

# Функция для вывода списка процессов
list_processes() {
    ps -eo pid,comm --sort pid
}
# Функция для вывода справки
show_help() {
    echo "Использование: $0 [опции]"
    echo ""
    echo "Опции:"
    echo "  -u, --users          Вывести список пользователей и их домашних директорий."
    echo "  -p, --processes      Вывести список запущенных процессов."
    echo "  -h, --help           Показать справку."
    echo "  -l PATH, --log PATH  Записать вывод в файл по заданному пути PATH."
    echo "  -e PATH, --errors PATH  Записать вывод ошибок в файл по заданному пути PATH."
}

# Переменные для обработки вывода
log_file="/home/oleg/complete.log"
error_file="/home/oleg/error.log"
exec 3>&1 4>&2

# Обработка аргументов командной строки
while getopts ":upl:he:-:" opt; do
    case $opt in
        u)
            output=$(list_users 2>&1) || error_output=$?
            ;;
        p)
            output=$(list_processes 2>&1) || error_output=$?
            ;;
        l)
            log_file="$OPTARG"
            ;;
        e)
            error_file="$OPTARG"
            ;;
        h)
            show_help
            exit 0
            ;;

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

#!/bin/bash

# Функция для вывода списка пользователей
list_users() {
    cut -d: -f1,6 /etc/passwd | sort
}

# Функция для вывода списка процессов
list_processes() {
    ps -eo pid,comm --sort pid
}

# Символ `char`

`char` є секцією, що відповідає за показ символу командного рядка. Типово, Spaceship використовує `➜` для індикації командного рядка.

Коли попередня команда була успішно виконана, символ командного рядка підсвічується зеленим (`SPACESHIP_CHAR_COLOR_SUCCESS`). В іншому випадку, якщо попередня команда завершується з ненульовим кодом, символ командного рядка — червоний (`SPACESHIP_CHAR_COLOR_FAILURE`).

## Зміна символу командного рядка для root

Типово, Spaceship не змінює символ командного рядка, коли команди виконуються від імені root. Ви можете встановити власний символ для командного рядка за допомогою параметра `SPACESHIP_CHAR_SYMBOL_ROOT`.

```zsh title=".zshrc"
SPACESHIP_CHAR_SYMBOL_ROOT="#"
```

## Опції

| Змінна                            |     За замовчуванням     | Пояснення                                                                       |
|:--------------------------------- |:------------------------:| ------------------------------------------------------------------------------- |
| `SPACESHIP_CHAR_PREFIX`           |            ``            | Префікс перед символом командного рядка                                         |
| `SPACESHIP_CHAR_SUFFIX`           |            ``            | Суфікс після символу командного рядка                                           |
| `SPACESHIP_CHAR_SYMBOL`           |           `➜`            | Символ командного рядка, що показуватиметься перед кожною командою              |
| `SPACESHIP_CHAR_SYMBOL_SUCCESS`   | `$SPACESHIP_CHAR_SYMBOL` | Символ командного рядка, що показуватиметься після успішного виконання команди  |
| `SPACESHIP_CHAR_SYMBOL_FAILURE`   | `$SPACESHIP_CHAR_SYMBOL` | Символ командного рядка, що показуватиметься після виконання команди з помилкою |
| `SPACESHIP_CHAR_SYMBOL_ROOT`      | `$SPACESHIP_CHAR_SYMBOL` | Prompt character to be shown before any command for the root user               |
| `SPACESHIP_CHAR_SYMBOL_SECONDARY` | `$SPACESHIP_CHAR_SYMBOL` | Другий символ командного рядка, що буде показуватись для незавершених команд    |
| `SPACESHIP_CHAR_COLOR_SUCCESS`    |         `green`          | Колір символу командного рядка, коли остання команда успішно завершується       |
| `SPACESHIP_CHAR_COLOR_FAILURE`    |          `red`           | Колір символу рядка, якщо остання команда повертає ненульовий код               |
| `SPACESHIP_CHAR_COLOR_SECONDARY`  |         `yellow`         | Колір другого символу командного рядка                                          |

# Go `golang`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info "Інформація"
    [**Go**](https://go.dev) — мова програмування, що дозволяє створювати просте, надійне та ефективне програмне забезпечення.

Секція `golang` відображає версію Go.

Ця секція відображається лише тоді, коли поточний каталог знаходиться у Go-проєкті, тобто:

* Пошук вгору знаходить файли `go.mod`, `Gopkg.toml`, `Gopkg.lock`, `glide.yaml` або теку `Godeps`
* Містить будь-який інший файл з розширенням `.go`
* Поточна тека визначення в змінній оточення GO — `$GOPATH`

## Використання розробницьких версій Go

Якщо ви використовуєте версію `Go`, що перебуває в стані розробки, замість номера версії буде показуватись хеш коміту git. Наприклад:

* `devel:5efe9a8f11` для версії в стані розробки
* `v1.11.4` для версії, що була випущена

## Параметри

| Змінна                    |          За замовчуванням          | Пояснення                               |
|:------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_GOLANG_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_GOLANG_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_GOLANG_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_GOLANG_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_GOLANG_SYMBOL` |                `🐹·`                | Символ, що відображається перед секцією |
| `SPACESHIP_GOLANG_COLOR`  |               `cyan`               | Колір секції                            |
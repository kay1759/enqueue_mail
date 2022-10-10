# EnqueueMail

This library provides enqueueing mail to [MailQueue](https://github.com/kay1759/mail_queue) in Elixir.

## Installation

The package can be installed by adding `enqueue_mail` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:enqueue_mail, "~> 0.1.2"}
  ]
end
```

## Configuration

Tha server has to be pointed with MailQueue.
The rest of settings have to be the same with MailQueue.

```elixir
config :enqueue_mail, EnqueueMail,
  amqp_server: "amqp://app:app@localhost",
  exchange:    "gen_server_mail_exchange",
  queue:       "gen_server_mail_queue",
  queue_error: "gen_server_mail_queue_error"
```

### Data Format:
    message Email {
      string from = 1;
      string to = 2; 
      string subject = 3;
      string text_body = 4; 
      string html_body = 5; 
    }

## Usage
```elixir
  def enqueue_mail(from, to, subject, text_body, html_body) do
    Email.new(
      from: from,
      to: to,
      subject: subject,
      text_body: text_body,
      html_body: html_body)
    |> Email.encode()
    |> EnqueueMail.send_mail()
  end
```
eex can be used for text_body and/or html_body.

for exapmple:
```elixir
html_body = EEx.eval_file(< eex template file >, [from: from,  email: email, title: title,  content: content])
  end
```

## References:
- [MailQueue](https://github.com/kay1759/mail_queue)
- [Protocol Buffers Official](https://developers.google.com/protocol-buffers/)
- [clojusc/protobuf (Elixir Protocol Buffer library)](https://github.com/clojusc/protobuf)
- [pma/amqp (Elixir AMQP client)](https://github.com/pma/amqp)

## Licence:

[MIT]

## Author

[Katsuyoshi Yabe](https://github.com/kay1759)

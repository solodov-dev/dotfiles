return {
  "Olical/conjure",
  init = function()
    vim.g["conjure#filetypes"] = {
      "clojure",
      "fennel",
      "janet",
      "racket",
      "scheme",
      "hy",
      "guile",
      "common-lisp",
    }
    -- use the dedicated guile-socket client for `scheme` files too,
    -- not the generic scheme/stdio one. see :help conjure-client-guile-socket.
    vim.g["conjure#filetype#scheme"] = "conjure.client.guile.socket"
    -- connect over a Unix socket at this absolute path. Guile's --listen
    -- refuses to start if the socket file already exists, so rm -f before launch.
    vim.g["conjure#client#guile#socket#pipename"] = "/tmp/.guile-repl.socket"
  end
}

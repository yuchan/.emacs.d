;;; init.el --- My Emacs Setting

;;; Commentary:
;;

;;; Code:

(require 'cl)
(require 'package)

;; package initialize
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; package management
(defvar installing-package-list
  '(
    sbt-mode
    racer
    elixir-mode
    scala-mode2
    clojure-mode
    coffee-mode
    markdown-mode
    yaml-mode
    rust-mode
    web-mode
    dockerfile-mode
    feature-mode
    cider
    queue
    dash
    w3m
    smex
    dash-at-point
    ensime
    init-loader
    popup
    company
    auto-complete
    popup
    init-loader
    lispxmp
    magit
    open-junk-file
    ox-reveal
    org
    paredit
    projectile-rails
    auto-complete
    inf-ruby
    inflections
    projectile
    pkg-info
    yasnippet
    exec-path-from-shell
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

(provide 'init)
;;; init.el ends here

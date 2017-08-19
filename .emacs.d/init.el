(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; パッケージ情報の更新
;;(package-refresh-contents)

;; インストールするパッケージ
(defvar my/favorite-packages
  '(
    init-loader
    helm
    col-highlight
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))

(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

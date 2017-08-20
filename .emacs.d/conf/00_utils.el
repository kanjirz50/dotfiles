;; helm
(require 'helm-config)
(helm-mode 1)

;; C-hで前の文字削除
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)


;;keybinds
;バックスペースをC-hに割り当てる
(global-set-key "\C-h" 'delete-backward-char)

;; theme
(load-theme 'misterioso t)

;;; 端末で作業をするときメニューバーを非表示
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

(require 'col-highlight)
;; アイドルになって0.2秒後桁を表示させる
(toggle-highlight-column-when-idle 1)
(col-highlight-set-interval 0.2)
;;; hl-lineと併用すればカーソル位置を十字形にハイライトできる
(custom-set-faces
 '(col-highlight ((t (:inherit hl-line)))))
(global-hl-line-mode 1)

;; company
(add-hook 'after-init-hook 'global-company-mode)

;; el-screen
(setq elscreen-prefix-key (kbd "C-z"))
(elscreen-start)

;; タブの先頭に[X]を表示しない
(setq elscreen-tab-display-kill-screen nil)
;;; header-lineの先頭に[<->]を表示しない
(setq elscreen-tab-display-control nil)


;; visual-regexp
(require 'visual-regexp)
(global-set-key (kbd "M-%") 'vr/query-replace)

;; mwim
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-e") 'mwim-end-of-code-or-line)

;; hlinum
(global-linum-mode t)
(setq linum-format "%4d ")

;; 行末の空白を表示
(setq-default show-trailing-whitespace t)

;; 対応する括弧を光らせる。
(show-paren-mode t)
(setq show-paren-style 'expression)
(setq show-paren-delay 0)
(set-face-background 'show-paren-match-face "blue")

;; create backup file in ~/.emacs.d/backup
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;; create auto-save file in ~/.emacs.d/backup
(setq auto-save-default t)
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backup/") t)))

; tramp-modeではbashを使う(zshはハングするらしい)
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

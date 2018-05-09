;; helm
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode t)

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

(require 'smartparens)
(smartparens-global-mode t)

(require 'linum)
(global-linum-mode 1)
(setq linum-format "%4d ")

;; company
(require 'company)
(global-company-mode t)
(company-quickhelp-mode t)

(set-face-attribute 'company-tooltip nil
		    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common-selection nil
                    :foreground "white" :background "steelblue")
(set-face-attribute 'company-tooltip-selection nil
                    :foreground "black" :background "steelblue")
(set-face-attribute 'company-preview-common nil
                    :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil
                    :background "orange")
(set-face-attribute 'company-scrollbar-bg nil
                    :background "gray40")

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)

(global-set-key (kbd "C-M-i") 'company-complete)
;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)

;; C-sで絞り込む
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)

;; TABで候補を設定
(define-key company-active-map (kbd "C-i") 'company-complete-selection)

;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)

(setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順')
(setq company-echo-delay 0)
(setq company-idle-delay 0.05) ; デフォルトは0.5
(setq company-minimum-prefix-length 2) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(setq company-tooltip-limit 20)
(setq company-begin-commands '(self-insert-command))')
(setq completion-ignore-case t)
(setq company-dabbrev-downcase nil)

;; jedi
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)

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

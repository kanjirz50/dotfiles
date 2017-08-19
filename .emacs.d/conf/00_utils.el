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

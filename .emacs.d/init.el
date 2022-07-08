;; yes / no を y/nにする
(fset 'yes-or-no-p 'y-or-n-p)

;; 時間表示
(display-time)

;; 行数を表示
(global-linum-mode)
(setq linum-format "%4d ")

(line-number-mode t)
(column-number-mode t)

;; メニューバーを非表示にする
(menu-bar-mode 0)

;;対応する括弧をハイライト
;; (show-paren-mode 1)
(show-paren-mode t)

;; バックアップファイルを保存しない
(setq make-backup-files nil)
(setq auto-save-default nil)

;; tabサイズ
(setq default-tab-width 4)

;; C-hで1文字削除
(global-set-key"\C-h" 'delete-backward-char)

;; 現在の行をハイライト
;; (global-hl-line-mode)

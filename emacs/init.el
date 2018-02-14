;;; ロードパスの追加
;;(setq load-path (append '("~/.emacs.d") load-path))


;; 環境を日本語、UTF-8にする
(set-locale-environment nil)

;;(add-to-list 'load-path "/usr/share/emacs24/site-lisp/emacs-mozc")
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'overlay)


(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; set font "Ricty Diminished Discord" or "Ricty Diminished"
;;(set-face-attribute 'default nil
;;                    :family "Ricty Diminished"
;;                    :height 130)

(set-face-font 'default "Ricty Diminished-14")

(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (cons "Ricty Diminished" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0212
                  (cons "Ricty Diminished" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (cons "Ricty Diminished" "iso10646-1"))


;;; Localeに合わせた環境の設定
;;(set-locale-environment nil)

;; スタートアップ非表示
(setq inhibit-startup-screen t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")



;;off scroll-bar, very heavy 
;;(scroll-bar-mode -1)
(global-hl-line-mode -1)

;;; メニューバーを消す
;;(menu-bar-mode -1)
;;; ツールバーを消す
(tool-bar-mode -1)

;;; カーソルの点滅を止める
(blink-cursor-mode 0)

;;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)


;; 行番号の表示
(global-linum-mode t)

;; toggle-trancate-lines関数を作って、トグル動作させる。
(global-set-key (kbd "C-c l") 'toggle-truncate-lines) ; ON/OFF
(defun toggle-truncate-lines ()
  (interactive)
  (if truncate-lines
    (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))


;;タブの代わりにスペースを用いる
(setq-default indent-tabs-mode nil)

;;=========================================
;; c-mode のインデントをスペース4個分のタブにする
(add-hook 'c-mode-common-hook
          '(lambda ()
;;             (c-set-style "k&r")
	     (setq c-basic-offset 4)
;;	     (setq indent-tabs-mode t)
	     (setq indent-tabs-mode nil)
	     (setq tab-width 4)))
(put 'downcase-region 'disabled nil)

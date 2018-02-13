;; tema adı badwolf
;; start package.el with emacs
(require 'package)
;; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; initialize package.el
(package-initialize)
;; start auto-complete with emacs
;;(require 'auto-complete)
;; do default config for auto-complete
;;(require 'auto-complete-config)
;;(ac-config-default)
;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
;; lets define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
;; now lets call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)
;; neotree
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-window-position 'right)
;; flycheck
;; (global-flycheck-mode)
;; projectile
(add-to-list 'load-path "/path/to/projectile/directory")
(require 'projectile)
(projectile-global-mode) ;; to enable in all buffers
;; tagedit
(eval-after-load 'sgml-mode
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))
;; helm-mode
(require 'helm-config)
(add-to-list 'load-path "/path/to/helm/directory")
(require 'helm-config)
;; tabbar
;;(require 'tabbar)
; turn on the tabbar
;; (tabbar-mode t)
; define all tabs to be one of 3 possible groups: “Emacs Buffer”, “Dired”,
;“User Buffer”.
(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    (t
     "User Buffer"
     )
    ))) 
(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

 (global-set-key [M-left] 'tabbar-backward-tab)
 (global-set-key [M-right] 'tabbar-forward-tab)
;; menubar
(menu-bar-mode -1)
;; toolbar
(tool-bar-mode -1)
;; scrollbar
(scroll-bar-mode -1)
;; emacs-backup-files-close
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files


;; flycheck-irony
;;(eval-after-load 'flycheck
;;  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; irony
;;(add-hook 'c++-mode-hook 'irony-mode)
;;(add-hook 'c-mode-hook 'irony-mode)
;;(add-hook 'objc-mode-hook 'irony-mode)
;; irony-devam
;;(defun my-irony-mode-hook ()
 ;;   (define-key irony-mode-map [remap completion-at-point]
  ;;    'irony-completion-at-point-async)
   ;; (define-key irony-mode-map [remap complete-symbol]
;;      'irony-completion-at-point-async))
;;  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;;  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


;; fly-check
(flycheck-mode -1)
;; global-company-mode
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay .1)
;; nyan-mode
(nyan-mode 1);
;; global-hl-line
;;(global-hl-line-mode 1)
;;(set-face-background 'hl-line "#3e4440")

;; golang autocomplete
(require 'go-autocomplete)
;; golang company
(require 'company-go)
;; golang indent hook
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))
;; golang projectile
(require 'go-projectile)
;; c++ indentation
(setq-default
    c-default-style "bsd"
    c-basic-offset 4)
(setq-default tab-width 4)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(ansi-term-color-vector
   [unspecified "#151515" "#ff0086" "#00c918" "#aba800" "#3777e6" "#ad00a1" "#3777e6" "#d0d0d0"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (badwolf)))
 '(custom-safe-themes
   (quote
	("604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "d3a406c5905923546d8a3ad0164a266deaf451856eca5f21b36594ffcb08413a" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "446cc97923e30dec43f10573ac085e384975d8a0c55159464ea6ef001f4a16ba" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" "ffca7ac44bfe9d585363f6bbf29f19529de216f85dce7a831dfc28883959ec05" "df21cdadd3f0648e3106338649d9fea510121807c907e2fd15565dde6409d6e9" "dad1453029a183e5837ebfd7de65f74df7e06554e39468c758c8197bfa749fec" "100eeb65d336e3d8f419c0f09170f9fd30f688849c5e60a801a1e6addd8216cb" "8cf1002c7f805360115700144c0031b9cfa4d03edc6a0f38718cef7b7cabe382" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "ef1e992ef341e86397b39ee6b41c1368e1b33d45b0848feac6a8e8d5753daa67" "722e1cd0dad601ec6567c32520126e42a8031cd72e05d2221ff511b58545b108" "3c9250705b4750e314d4e78c584b862415e183e16f76cc6fc18f0bd6f3d69b37" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "50ff65ab3c92ce4758cc6cd10ebb3d6150a0e2da15b751d7fbee3d68bba35a94" "4bf5c18667c48f2979ead0f0bdaaa12c2b52014a6abaa38558a207a65caeb8ad" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "ffe80c88e3129b2cddadaaf78263a7f896d833a77c96349052ad5b7753c0c5a5" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "d9850d120be9d94dd7ae69053630e89af8767c36b131a3aa7b06f14007a24656" "7a2ac0611ded83cdd60fc4de55ba57d36600eae261f55a551b380606345ee922" "80930c775cef2a97f2305bae6737a1c736079fdcc62a6fdf7b55de669fbbcd13" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "250268d5c0b4877cc2b7c439687f8145a2c85a48981f7070a72c7f47a2d2dc13" "3f67aee8f8d8eedad7f547a346803be4cc47c420602e19d88bdcccc66dba033b" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "f984e2f9765a69f7394527b44eaa28052ff3664a505f9ec9c60c088ca4e9fc0b" "9c4acf7b5801f25501f0db26ac3eee3dc263ed51afd01f9dcfda706a15234733" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" "264b639ee1d01cd81f6ab49a63b6354d902c7f7ed17ecf6e8c2bd5eb6d8ca09c" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "1025e775a6d93981454680ddef169b6c51cc14cea8cb02d1872f9d3ce7a1da66" "5a39d2a29906ab273f7900a2ae843e9aa29ed5d205873e1199af4c9ec921aaab" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "a62f0662e6aa7b05d0b4493a8e245ab31492765561b08192df61c9d1c7e1ddee" "45a8b89e995faa5c69aa79920acff5d7cb14978fbf140cdd53621b09d782edcf" "41eb3fe4c6b80c7ad156a8c52e9dd6093e8856c7bbf2b92cc3a4108ceb385087" "3e34e9bf818cf6301fcabae2005bba8e61b1caba97d95509c8da78cff5f2ec8e" "cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "d2bd16a8bcf295dce0b70e1d2b5c17bb34cb28224a86ee770d56e6c22a565013" "8be07a2c1b3a7300860c7a65c0ad148be6d127671be04d3d2120f1ac541ac103" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "808b47c5c5583b5e439d8532da736b5e6b0552f6e89f8dafaab5631aace601dd" "146061a7ceea4ccc75d975a3bb41432382f656c50b9989c7dc1a7bb6952f6eb4" "2a998a3b66a0a6068bcb8b53cd3b519d230dd1527b07232e54c8b9d84061d48d" "50d07ab55e2b5322b2a8b13bc15ddf76d7f5985268833762c500a90e2a09e7aa" "4feee83c4fbbe8b827650d0f9af4ba7da903a5d117d849a3ccee88262805f40d" "d83e34e28680f2ed99fe50fea79f441ca3fddd90167a72b796455e791c90dc49" "fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" "8543b328ed10bc7c16a8a35c523699befac0de00753824d7e90148bca583f986" "5b8eccff13d79fc9b26c544ee20e1b0c499587d6c4bfc38cabe34beaf2c2fc77" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "6145e62774a589c074a31a05dfa5efdf8789cf869104e905956f0cbd7eda9d0e" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "c9f102cf31165896631747fd20a0ca0b9c64ecae019ce5c2786713a5b7d6315e" "7a1190ad27c73888f8d16142457f59026b01fa654f353c17f997d83565c0fc65" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" "50b64810ed1c36dfb72d74a61ae08e5869edc554102f20e078b21f84209c08d1" "986e7e8e428decd5df9e8548a3f3b42afc8176ce6171e69658ae083f3c06211c" "87d46d0ad89557c616d04bef34afd191234992c4eb955ff3c60c6aa3afc2e5cc" "25c242b3c808f38b0389879b9cba325fb1fa81a0a5e61ac7cae8da9a32e2811b" "aded4ec996e438a5e002439d58f09610b330bbc18f580c83ebaba026bbef6c82" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "7bef2d39bac784626f1635bd83693fae091f04ccac6b362e0405abf16a32230c" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" "25c06a000382b6239999582dfa2b81cc0649f3897b394a75ad5a670329600b45" "36282815a2eaab9ba67d7653cf23b1a4e230e4907c7f110eebf3cdf1445d8370" "fc7fd2530b82a722ceb5b211f9e732d15ad41d5306c011253a0ba43aaf93dccc" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "542e6fee85eea8e47243a5647358c344111aa9c04510394720a3108803c8ddd1" "f5f3a6fb685fe5e1587bafd07db3bf25a0655f3ddc579ed9d331b6b19827ea46" "04790c9929eacf32d508b84d34e80ad2ee233f13f17767190531b8b350b9ef22" "428bdd4b98d4d58cd094e7e074c4a82151ad4a77b9c9e30d75c56dc5a07f26c5" "b0c5c6cc59d530d3f6fbcfa67801993669ce062dda1435014f74cafac7d86246" "304c39b190267e9b863c0cf9c989da76dcfbb0649cbcb89592e7c5c08348fce9" "ec3e6185729e1a22d4af9163a689643b168e1597f114e1cec31bdb1ab05aa539" "69e7e7069edb56f9ed08c28ccf0db7af8f30134cab6415d5cf38ec5967348a3c" "732ccca2e9170bcfd4ee5070159923f0c811e52b019106b1fc5eaa043dff4030" "0961d780bd14561c505986166d167606239af3e2c3117265c9377e9b8204bf96" "b67b2279fa90e4098aa126d8356931c7a76921001ddff0a8d4a0541080dee5f6" "c614d2423075491e6b7f38a4b7ea1c68f31764b9b815e35c9741e9490119efc0" "a61109d38200252de49997a49d84045c726fa8d0f4dd637fce0b8affaa5c8620" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "350dc341799fbbb81e59d1e6fff2b2c8772d7000e352a5c070aa4317127eee94" "fee4e306d9070a55dce4d8e9d92d28bd9efe92625d2ba9d4d654fc9cd8113b7f" "ad16a1bf1fd86bfbedae4b32c269b19f8d20d416bd52a87cd50e355bf13c2f23" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "19ba41b6dc0b5dd34e1b8628ad7ae47deb19f968fe8c31853d64ea8c4df252b8" "889a93331bc657c0f05a04b8665b78b3c94a12ca76771342cee27d6605abcd0e" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "55ed02951e7b458e4cd18837eefa1956884c9afd22bb514f697fd1d2d1abb3d3" "72c7c8b431179cbcfcea4193234be6a0e6916d04c44405fc87905ae16bed422a" "d61fc0e6409f0c2a22e97162d7d151dee9e192a90fa623f8d6a071dbf49229c6" "66881e95c0eda61d34aa7f08ebacf03319d37fe202d68ecf6a1dbfd49d664bc3" "5e52ce58f51827619d27131be3e3936593c9c7f9f9f9d6b33227be6331bf9881" "b9cbfb43711effa2e0a7fbc99d5e7522d8d8c1c151a3194a4b176ec17c9a8215" "b9a06c75084a7744b8a38cb48bc987de10d68f0317697ccbd894b2d0aca06d2b" "a19265ef7ecc16ac4579abb1635fd4e3e1185dcacbc01b7a43cf7ad107c27ced" default)))
 '(fci-rule-color "#383838")
 '(frame-brackground-mode (quote dark))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
	(("#3C3D37" . 0)
	 ("#679A01" . 20)
	 ("#4BBEAE" . 30)
	 ("#1DB4D0" . 50)
	 ("#9A8F21" . 60)
	 ("#A75B00" . 70)
	 ("#F309DF" . 85)
	 ("#3C3D37" . 100))))
 '(hl-paren-background-colors (quote ("#e8fce8" "#c1e7f8" "#f8e8e8")))
 '(hl-paren-colors (quote ("#40883f" "#0287c8" "#b85c57")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
	("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
	(badwolf-theme monokai-theme go-projectile go-add-tags go-autocomplete company-go atom-one-dark-theme atom-dark-theme dracula-theme plan9-theme base16-theme nyan-mode underwater-theme occidental-theme color-theme-sanityinc-solarized solarized-theme light-soap-theme sunny-day-theme company company-irony irony ## auto-complete-clang gruber-darker-theme flycheck-irony forest-blue-theme zenburn-theme tagedit tabbar projectile neotree helm flycheck auto-complete-clang-async auto-complete-c-headers ac-clang ac-c-headers)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(sml/active-background-color "#98ece8")
 '(sml/active-foreground-color "#424242")
 '(sml/inactive-background-color "#4fa8a8")
 '(sml/inactive-foreground-color "#424242")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
	((20 . "#BC8383")
	 (40 . "#CC9393")
	 (60 . "#DFAF8F")
	 (80 . "#D0BF8F")
	 (100 . "#E0CF9F")
	 (120 . "#F0DFAF")
	 (140 . "#5F7F5F")
	 (160 . "#7F9F7F")
	 (180 . "#8FB28F")
	 (200 . "#9FC59F")
	 (220 . "#AFD8AF")
	 (240 . "#BFEBBF")
	 (260 . "#93E0E3")
	 (280 . "#6CA0A3")
	 (300 . "#7CB8BB")
	 (320 . "#8CD0D3")
	 (340 . "#94BFF3")
	 (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "SF Mono" :foundry "UKWN" :slant normal :weight normal :height 120 :width extra-condensed)))))
(set-language-environment "UTF-8")

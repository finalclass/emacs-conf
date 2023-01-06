(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  
  :config
  (projectile-mode)
  (defun my-projectile-project-find-function (dir)
    (let ((root (projectile-project-root dir)))
      (and root (cons 'transient root))))
  
  
  (with-eval-after-load 'project
    (add-to-list 'project-find-functions 'my-projectile-project-find-function))
  )

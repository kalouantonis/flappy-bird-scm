(use sdl2 sdl2-types sdl2-raw
     miscmacros extras)

(define (shutdown) (sdl-quit))

(define (init title width height)
  (sdl-init #:video #:events #:timer)
  ;; Define an automatic exit routine
  (on-exit shutdown)

  (sdl-create-window title
                     #:centered 100
                     ;; Dimensions
                     width height
                     ;; Flags
                     #:shown #:resizable))

(define (render window)
  (SDL_FillRect (sdl-window-surface window)
                #f
                (SDL_MapRGB
                    (sdl-surface-format (sdl-window-surface window))
                    0 50 128))) 
  

(define (main-loop window)
  (call/cc
    (lambda (quit)
      (let loop ()
        (select (sdl-event-type (sdl-wait-event))
            ;; Window exposed, resized, etc...
            [(SDL_WINDOWEVENT)
            (render window) 
            (sdl-update-window-surface window)]

            ;; User requested that the app quit
            [(SDL_QUIT)
            (quit #f)])
        (loop)))))

(define-constant +window-title+ "Flappy Bird")
(define-constant +width+ 800)
(define-constant +height+ 600)

(define (run-game)
  (let [(window (init +window-title+ +width+ +height+))]
    (main-loop window)))

;; Top level run when we're not running in interactive mode
(when (not (feature? 'csi))
  (run-game))

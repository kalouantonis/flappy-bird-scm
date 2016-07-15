(use sdl2 sdl2-types sdl2-raw)

(define shutdown sdl-quit)

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

;; Function that
(define exit-game
  ;; We're not using the args at the moment
  (lambda _
    (error "Undefined exit continuation")))

(define (main-loop window)
  (call/cc
    (lambda (quit)
      ;; Store continuation somewhere so as to be used to arbitrarily exit at
      ;; any point. E.g. Menu button 'exit' is clicked.
      (set! exit-game quit)

      (let loop ()
        (select (sdl-event-type (sdl-wait-event))
            ;; Window exposed, resized, etc...
            [(SDL_WINDOWEVENT)
             (begin
                (render window)
                (sdl-update-window-surface window))]

            ;; User requested that the app quit
            [(SDL_QUIT)
             (exit-game #f)])
        (loop)))))

(define-constant +window-title+ "Flappy Bird")
(define-constant +window-width+ 400)
(define-constant +window-height+ 640)

(define (run-game)
  (let [(window (init +window-title+ +window-width+ +window-height+))]
    (main-loop window)))

;; Top level run when we're not running in interactive mode
(when (not (feature? 'csi))
  (run-game))

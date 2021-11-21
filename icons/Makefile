ICONS = emacs-big-sur-icon.png \
emacs-icons-project-EmacsIcon1.png \
emacs-icons-project-EmacsIcon2.png \
emacs-icons-project-EmacsIcon3.png \
emacs-icons-project-EmacsIcon4.png \
emacs-icons-project-EmacsIcon5.png \
emacs-icons-project-EmacsIcon6.png \
emacs-icons-project-EmacsIcon7.png \
emacs-icons-project-EmacsIcon8.png \
emacs-icons-project-EmacsIcon9.png \
emacs-icons-project-emacs-card-blue-deep.png \
emacs-icons-project-emacs-card-british-racing-green.png \
emacs-icons-project-emacs-card-carmine.png \
emacs-icons-project-emacs-card-green.png \
emacs-sexy-icon.png \
gnu-head-icon.png \
modern-icon.png \
sjrmanning-icon.png \
spacemacs-icon.png

%.png: %.icns
	sips --resampleWidth 100 -s format png $< --out $@

previews: $(ICONS)

clean:
	rm *.png

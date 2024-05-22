(define-module (ibuki packages suckless)
  #:use-module (gnu packages suckless)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (guix gexp)

  #:export (thaenz-st)
  #:export (thaenz-dwm))

(define STPATCH
"
diff --git a/config.def.h b/config.def.h
index 91ab8ca..a068694 100644
--- a/config.def.h
+++ b/config.def.h
@@ -96,32 +96,24 @@ unsigned int tabspaces = 8;
 /* Terminal colors (16 first used in escape sequence) */
 static const char *colorname[] = {
 	/* 8 normal colors */
-	\"black\",
-	\"red3\",
-	\"green3\",
-	\"yellow3\",
-	\"blue2\",
-	\"magenta3\",
-	\"cyan3\",
-	\"gray90\",
+	[0] = \"#282828\", /* hard contrast: #1d2021 / soft contrast: #32302f */
+	[1] = \"#cc241d\", /* red     */
+	[2] = \"#98971a\", /* green   */
+	[3] = \"#d79921\", /* yellow  */
+	[4] = \"#458588\", /* blue    */
+	[5] = \"#b16286\", /* magenta */
+	[6] = \"#689d6a\", /* cyan    */
+	[7] = \"#a89984\", /* white   */
 
 	/* 8 bright colors */
-	\"gray50\",
-	\"red\",
-	\"green\",
-	\"yellow\",
-	\"#5c5cff\",
-	\"magenta\",
-	\"cyan\",
-	\"white\",
-
-	[255] = 0,
-
-	/* more colors can be added after 255 to use with DefaultXX */
-	\"#cccccc\",
-	\"#555555\",
-	\"gray90\", /* default foreground colour */
-	\"black\", /* default background colour */
+	[8]  = \"#928374\", /* black   */
+	[9]  = \"#fb4934\", /* red     */
+	[10] = \"#b8bb26\", /* green   */
+	[11] = \"#fabd2f\", /* yellow  */
+	[12] = \"#83a598\", /* blue    */
+	[13] = \"#d3869b\", /* magenta */
+	[14] = \"#8ec07c\", /* cyan    */
+	[15] = \"#ebdbb2\", /* white   */
 };
 
 
@@ -129,9 +121,9 @@ static const char *colorname[] = {
  * Default colors (colorname index)
  * foreground, background, cursor, reverse cursor
  */
-unsigned int defaultfg = 258;
-unsigned int defaultbg = 259;
-unsigned int defaultcs = 256;
+unsigned int defaultfg = 15;
+unsigned int defaultbg = 0;
+unsigned int defaultcs = 15;
 static unsigned int defaultrcs = 257;
 
 /*
")

(define-public thaenz-st
  (package
    (inherit st)
    (name "thaenz-st")
    (arguments
      (substitute-keyword-arguments (package-arguments st)
	((#:phases phases)
	  #~(modify-phases #$phases
	    (add-after 'unpack 'patch-st
	      (lambda* _
	       (let* ((st-patch #$(plain-file "st.patch" STPATCH)))
		(system* "patch" "-p1" "-i" st-patch))))))))))

(define-public thaenz-dwm
  (package
    (inherit dwm)
    (name "thaenz-dwm")
    (version "6.5")
    (source (origin
	      (method url-fetch)
	      (uri (string-append "https://dl.suckless.org/dwm/dwm-"
				  version ".tar.gz"))
	      (sha256
		(base32 "0acpl05rg6rg6nrg3rv4kp388iqzp1n6dhin30a97yzjm6zrxmr1"))))))

class Phoenix < Formula
  desc "Small command-line image forensics tool"
  homepage "https://github.com/ebemunk/phoenix"
  url "https://github.com/ebemunk/phoenix/archive/1.1.tar.gz"
  sha256 "fd313b2caf7f97cc5018129e7dba72ab6e2d27bd886fddbdcf55532277edd20f"

  depends_on "homebrew/science/opencv"
  depends_on "pkgconfig" => :build
  depends_on "boost"

  # fix the build on OS X [TODO: raise the issue upstream]
  patch :DATA

  def install
    # don't build for windows
    inreplace "Makefile", "WIN = 1", ""

    bin.mkpath
    system "make", "OCV_INC=#{Formula["homebrew/science/opencv"].include}",
                   "BOOST_INC=#{Formula["boost"].include}",
                   "BIN_DIR=#{bin}"
  end

  test do
    system "#{bin}/phoenix", "--ela", "-j", "-f", test_fixtures("test.jpg")
  end
end

__END__
diff --git a/debugger.cpp b/debugger.cpp
index 13dd689..c504762 100644
--- a/debugger.cpp
+++ b/debugger.cpp
@@ -21,7 +21,7 @@ debugger& debugger::instance() {
 void debugger::start(string msg) {
 	if(!active) return;
 
-	t_start = chrono::high_resolution_clock::now();
+	t_start = chrono::system_clock::now();
 	print(msg + " starting");
 }
 
@@ -29,7 +29,7 @@ void debugger::start(string msg) {
 void debugger::end(string msg) {
 	if(!active) return;
 
-	t_end = chrono::high_resolution_clock::now();
+	t_end = chrono::system_clock::now();
 
 	int secs = chrono::duration_cast<chrono::seconds>(t_end - t_start).count();
 	int millisecs = chrono::duration_cast<chrono::milliseconds>(t_end - t_start).count();
@@ -46,4 +46,4 @@ void debugger::print(string msg) {
 	if(!active) return;
 
 	cout << "DEBUG: " << msg << endl;
-}
\ No newline at end of file
+}


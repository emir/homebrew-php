require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70Ssh2 < AbstractPhp70Extension
  init
  desc "Provides bindings to the functions of libssh2 which implements the SSH2 protocol."
  homepage "https://pecl.php.net/package/ssh2"
  head "https://github.com/php/pecl-networking-ssh2.git", :branch => "master"

  depends_on "libssh2"

  def install
    safe_phpize

    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"

    prefix.install "modules/ssh2.so"

    write_config_file if build.with? "config-file"
  end
end

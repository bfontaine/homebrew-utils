# frozen_string_literal: true

# code based on:
#   https://github.com/stripe/homebrew-stripe-cli/blob/master/stripe.rb
# extended to support both macOS and Linux

class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "1.7.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.7.0/stripe_1.7.0_mac-os_x86_64.tar.gz"
      sha256 "e59ad1765eb630ce7a6949550afbb4a203d6198b226425ac57400d6ad98a6c33"
    elsif Hardware::CPU.arm?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.7.0/stripe_1.7.0_mac-os_arm64.tar.gz"
      sha256 "17983bca1d395d12a13db1852fe5947da42f718c314d830943221bbd3d839a1a"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/stripe/stripe-cli/releases/download/v1.7.0/stripe_1.7.0_linux_x86_64.tar.gz"
    sha256 "4a82bd2d5c38260cefb0837d04016ba3c7f56949ff788d4090152616f4aa45b4"
  end

  def install
    bin.install "stripe"
    system bin/"stripe", "completion", "--shell", "bash"
    system bin/"stripe", "completion", "--shell", "zsh"
    bash_completion.install "stripe-completion.bash"
    zsh_completion.install "stripe-completion.zsh"
    (zsh_completion/"_stripe").write <<~EOS
      #compdef stripe
      _stripe () {
        local e
        e=$(dirname ${funcsourcetrace[1]%:*})/stripe-completion.zsh
        if [[ -f $e ]]; then source $e; fi
      }
    EOS
  end

  def caveats
    <<~EOS
      ❤ Thanks for installing the Stripe CLI! If this is your first time using the CLI, be sure to run `stripe login` first.
    EOS
  end

  test do
    system bin/"stripe", "--help"
  end
end

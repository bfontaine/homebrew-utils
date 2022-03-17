# frozen_string_literal: true

# code based on:
#   https://github.com/stripe/homebrew-stripe-cli/blob/master/stripe.rb
# extended to support both macOS and Linux

class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "1.8.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.8.1/stripe_1.8.1_mac-os_x86_64.tar.gz"
      sha256 "a59b9b2b54b3a3bca774c715012bf2f427b317ca998cdbd8c794b11b63817f70"
    elsif Hardware::CPU.arm?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.8.1/stripe_1.8.1_mac-os_arm64.tar.gz"
      sha256 "f97c4b71f77ea2bde4cd8f5e020270d6ff6db7834a2313b93d24e31b375f801b"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/stripe/stripe-cli/releases/download/v1.8.1/stripe_1.8.1_linux_x86_64.tar.gz"
    sha256 "224948411300d9e5c5d626eefe3f48de69b4be2c07bc8458fc1e84f4d1b44fdb"
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

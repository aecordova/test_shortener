class Url < ApplicationRecord
  after_create :save_shortened_url

  private

  def save_shortened_url
    update(short_url: encoded_url(id))
  end

  def encoded_url(id)
    return ALPHABET[0] if id == 0

    s = ''
    base = ALPHABET.length
    while id > 0
      s << ALPHABET[id.modulo(base)]
      id /= base
    end
    s.reverse
  end

  ALPHABET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.split(//)
end

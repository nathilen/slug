class Slug
  def initialize(text)
    @text = text
  end

  def transformed
    replacements = {' ' => '/\s{2,}/', '-' => '/\s/', '' => '/[^a-z\d+-]/'}
    slug = @text.downcase
    replacements.each_pair do |key, value|
      slug.gsub!(eval(value), key)
    end
    slug
  end
end

class Article < ActiveRecord::Base
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings

	def tag_list
		self.tags.map { |t| t.name }.join(', ')
	end
	def tag_list=(tags_string)
		tag_names = tags_string.split(',').map { |t| t.strip.downcase }.uniq
		new_or_found_tags = tag_names.collect { |t| Tag.find_or_create_by(name: t) }
		self.tags = new_or_found_tags
	end
end

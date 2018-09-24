class Skin < ApplicationRecord
	has_one_attached :cover
	has_many_attached :images
	after_create :scale_cover

	default_scope { order(name: :asc)}

	belongs_to :type
	belongs_to :color
	belongs_to :hardness

	validates :name, :description, :video, presence: true
	validate :images_type
	validate :cover_type

	filterrific(
	 available_filters: [
	   :with_type_id,
	   :with_color_id,
	   :with_target,
	   :with_hardness_id,
	   :search_query
	 ]
	)

	scope :search_query, lambda { |query|
	  return nil  if query.blank?

	  terms = query.to_s.split(/\s+/)

	  terms = terms.map { |e|
	    (e.gsub('*', '%') + '%').gsub(/%+/, '%')
	  }

	  num_or_conds = 2
	  where(
	    terms.map { |term|
	      "(LOWER(skins.name) LIKE ? OR LOWER(skins.sname) LIKE ?)"
	    }.join(' AND '),
	    *terms.map { |e| [e] * num_or_conds }.flatten
	  )
	}

	scope :with_type_id, lambda { |type_ids|
	  where(type_id: [*type_ids])
	}

	scope :with_color_id, lambda { |color_ids|
	  where(color_id: [*color_ids])
	}

	scope :with_target, lambda { |target|
	  where("targets ILIKE LOWER(?)", "%#{Target.find(target).name}%")
	}

	scope :with_hardness_id, lambda { |hardness_ids|
	  where(hardness_id: [*hardness_ids])
	}

	def thumbnail input
		return input.variant(resize: '500x500').processed
	end

	def scale_cover
	    resized_cover = MiniMagick::Image.read(cover.download)
	    resized_cover.resize("1500x1500")

	    cover.attach(
	      io: File.open(resized_cover.path),
	      filename: cover.filename,
	      content_type: cover.content_type)
	end

	private
	def images_type
		if images.attached? == false
			errors.add(:images, "забыл, ну ты даёшь.")
		end
		
	end

	def cover_type
		if cover.attached? == false
			errors.add(:cover, "сама загрузится по-твоему?")
		else
			if !cover.content_type.in?(%('image/jpeg image/png'))
				errors.add(:cover, "можно только JPEG и PNG.")
			end	
		end
	end
end

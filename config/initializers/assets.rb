# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join("app","assets","fonts")
Rails.application.config.assets.precompile += %w(appointments.css)
Rails.application.config.assets.precompile += %w(bootstrap/bootstrap.css)
Rails.application.config.assets.precompile += %w(datetimepicker.js)

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

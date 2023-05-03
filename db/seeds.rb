# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'

5.times do
  manga = Manga.create!(
    manga_title: Faker::Book.title,
    # author: Faker::Book.author,
    description: Faker::Lorem.paragraph,
    user_id: 1 # Assuming a user with id 1 exists, change this to a valid user_id
  )

  cover_image_url = Faker::LoremFlickr.image(size: "300x400", search_terms: ['manga', 'comic'])
  cover_image_file = URI.open(cover_image_url)
  manga.photo.attach(io: cover_image_file, filename: "cover_#{manga.id}.jpg", content_type: 'image/jpeg')

  2.times do |i|
    chapter = Chapter.create!(
      chapter_title: Faker::Lorem.sentence,
      chapter_number: i + 1,
      manga_id: manga.id
    )

    # Read the sample PDF file from the lib/assets directory
    pdf_file_path = Rails.root.join('lib', 'assets', 'sample_chapter.pdf')
    pdf_file = File.open(pdf_file_path, 'rb')

    chapter.pdf.attach(io: pdf_file, filename: "chapter_#{chapter.id}.pdf", content_type: 'application/pdf')
  end
end

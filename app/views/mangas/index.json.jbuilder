# jbuilder view for the create action of the MangasController
if params[:query].present?
  json.search_results render(partial: '/mangas/results', formats: :html,locals: { manga: @manga })
else
  json.empty_form render(partial: '/mangas/search', formats: :html,locals: { mangas: @mangas, manga: Manga.all })
end

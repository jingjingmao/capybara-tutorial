module PageWithPostList
	include Gizmo::PageMixin

	def valid?
		has_css?('.parent .left')
	end

	def posts_in_list
		find('.parent .left table').find('tbody').all('tr')
	end

	def new_post_link
		find('.parent .left a[href="/posts/new"]')
	end

	define_action :fill_post do |title, content|
		fill_in('post_title', with: title)
		fill_in('post_content', with: content)
	end

	def create_post_button
		find('.actions input[value="Create Post"]')
	end

	def back_link
		find('a[href="/posts"]')
	end

	def success_message
		find('#notice').text
	end

	def status_migration
		find('.tips')
	end

	def top_list
		find('.top-10-list')
	end

  def edit_link
		find('a[href="/posts/1/edit"]')
	end

  def update_post_button
		find('.actions input[value="Update Post"]')
	end
end
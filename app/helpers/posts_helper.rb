module PostsHelper
    
    def display_posts
        if @user.posts.empty?
          tag.h2(link_to('No posts yet - write a post here', new_post_path))
        else
          content_tag(:h2, "Your Posts:")
        end 
    end 
end

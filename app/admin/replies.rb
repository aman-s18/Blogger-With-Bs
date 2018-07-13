ActiveAdmin.register Reply do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :body, :comment_id

form do |form|
	form.inputs do
		form.input :comment_id, :label => 'Comment Id', :as => :select, :collection => Comment.all.map{|u| ["#{u.id}.#{u.body} ", u.id]}
		form.input :body, :label => 'Reply'
		
		#f.input :places, :as => :select2_multiple, :collection => Place.all
			end
			form.actions

		end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end

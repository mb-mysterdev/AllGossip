class UsersController < ApplicationController

    def index
      
        # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
      end
    
      def show
        @users = User.all
        @id_users = User.find(params['id'])
        @city = @id_users.city_id

        # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
      end
    
      def new
        @user = User.last
      end
    
      def create

      @user = User.new
      @user.last_name = params['last_name']
      @user.first_name = params['first_name']
      @user.email = params['user_email']
      @user.age = params['user_age']
      @user.password = params['user_password']
      @user.password_confirmation = params['password_confirmation']
      @user.description = params['user_description']
      @user.city_id = City.all.sample.id
      
      
      if @user.save # essaie de sauvegarder en base @gossip
       
        redirect_to users_path
        
      else
         render :template => 'users/new'# sinon, il render la view 
        # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
        # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
      end
    end
    
      def edit
        # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
      end
    
      def update
        # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params
        # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
      end
    
      def destroy
        # Méthode qui récupère le potin concerné et le détruit en base
        # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
      end


end

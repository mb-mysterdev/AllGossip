class GossipsController < ApplicationController


    def index

        @gossips = Gossip.all

        # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
      end
    
      def show
        @id_gossips = Gossip.find(params['id'])
        @comments = Comment.all
        @comment_set = Comment.where(gossip_id: @id_gossips)
        @comment_author = User.where(id: @id_gossips.user_id)

        # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
      end
    
   
   
    
      def edit
        @id_gossips = Gossip.find(params['id'])

        # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
      end
    
      def update
        @id_gossips = Gossip.find(params['id'])
        gossip_params = params.require(:gossip).permit(:title, :content)
        @id_gossips.update(gossip_params)
        redirect_to gossip_path
        # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params
        # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
      end
    
      def destroy
        @gossip = Gossip.find(params['id'])
        @gossip.destroy

        redirect_to gossips_path
        # Méthode qui récupère le potin concerné et le détruit en base
        # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
      end

      def new
        @gossip = Gossip.new
        # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
      end
    
      def create
   
        @gossip = Gossip.create(gossip_params)
        redirect_to gossips_path
        # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
        # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
      end


      private 

      def gossip_params
          params.require(:gossip).permit(:title, :content, :user_id)

      end

end

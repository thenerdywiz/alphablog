class ArticlesController < ApplicationsController
  
  
def index
    


@articles = Article.all

    
end

    

    
    
def new
   
    @articles = Article.new
    
end


def edit
    @articles = Article.find(params[:id])


end 
    def create
      @articles = Article.new(article_params)
           
        if @articles.save
        
        flash[:notice] = "Article ws sucessfully created"
        redirect_to article_path(@articles)
    else 
        render 'new'
        
        end
    
    end
    
    def update
       
       @articles = Article.find(params[:id])
       if @articles.update(article_params)
           flash[:notice] = "Article was successfully updated"
           redirect_to article_path(@articles)
        else
            
            render 'edit'
       end
        
    end

    def show

    @article = Article.find(params[:id])

    end


def destroy
    @articles = Article.find(params[:id])
    
    @articles.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
end



private

def article_params
    
    params.require(:article).permit(:title, :description)
end


end


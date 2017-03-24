class PortfoliosController < ApplicationController
  layout 'portfolio'
  def index
    @portfolio_items = Portfolio.all
  end
  
  def angular
    @angular_portfolio_items = Portfolio.angular
  end
  
  def new
    @portfolio_items = Portfolio.new
    3.times {@portfolio_items.technologies.build}
  end
  
  def edit
    @portfolio_items = Portfolio.find(params[:id])
  end
  
  def create
    @portfolio_items = Portfolio.new(portfolios_params)

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: 'your Portfolio item is now live.' }

      else
        format.html { render :new }
      end
    end
  end
  
  def update
    @portfolio_items = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_items.update(portfolios_params)
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
        
      else
        format.html { render :edit }
        
      end
    end
  end


  def show
    @portfolio_items = Portfolio.find(params[:id])
  end
  
  def destroy
    @portfolio_items = Portfolio.find(params[:id])
    @portfolio_items.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      
    end
  end
  
  private
    def portfolios_params
      params.require(:portfolio).permit(:title,:subtitle, :body, 
                                                technologies_attributes: [:name]
                                        )    
    end
  

end

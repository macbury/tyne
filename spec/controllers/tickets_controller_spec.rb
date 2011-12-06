require 'spec_helper'


describe TicketsController do
  describe "not_logged_in" do
    it "should redirect to login page" do
      get :index
      subject.response.should redirect_to(login_path)
    end
  end

  describe "logged in" do
    before :each do
      subject.stub(:require_login).and_return(:foo)
    end

    def valid_attributes
      @project = Factory(:project)
      @type = Factory(:ticket_type)
      Factory.attributes_for(:ticket).merge({:ticket_type_id => @type.id, :project_id => @project.id})
    end

    describe "GET index" do
      it "assigns all tickets as @tickets" do
        ticket = Ticket.create! valid_attributes
        get :index
        assigns(:tickets).should eq([ticket])
      end
    end

    describe "GET show" do
      it "assigns the requested ticket as @ticket" do
        ticket = Ticket.create! valid_attributes
        get :show, :id => ticket.id.to_s
        assigns(:ticket).should eq(ticket)
      end
    end

    describe "GET new" do
      it "assigns a new ticket as @ticket" do
        get :new
        assigns(:ticket).should be_a_new(Ticket)
      end
    end

    describe "GET edit" do
      it "assigns the requested ticket as @ticket" do
        ticket = Ticket.create! valid_attributes
        get :edit, :id => ticket.id.to_s
        assigns(:ticket).should eq(ticket)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Ticket" do
          expect {
            post :create, :ticket => valid_attributes
          }.to change(Ticket, :count).by(1)
        end

        it "assigns a newly created ticket as @ticket" do
          post :create, :ticket => valid_attributes
          assigns(:ticket).should be_a(Ticket)
          assigns(:ticket).should be_persisted
        end

        it "redirects to the created ticket" do
          post :create, :ticket => valid_attributes
          response.should redirect_to(ticket_url(Ticket.last))
        end

        it "should display the form again if the form has been submitted with invalid arguments" do
          expect do
            post :create, :ticket => {}
          end.to_not change(Ticket, :count).by(1)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved ticket as @ticket" do
          post :create, :ticket => {}
          assigns(:ticket).should be_a_new(Ticket)
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested ticket" do
          ticket = Ticket.create! valid_attributes
          # Assuming there are no other tickets in the database, this
          # specifies that the Ticket created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Ticket.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => ticket.id, :ticket => {'these' => 'params' }, :actions => { :event => "" }
        end

        it "assigns the requested ticket as @ticket" do
          ticket = Ticket.create! valid_attributes
          put :update, :id => ticket.id, :ticket => valid_attributes, :actions => { :event => "" }
          assigns(:ticket).should eq(ticket)
        end

        it "redirects to the ticket" do
          ticket = Ticket.create! valid_attributes
          put :update, :id => ticket.id, :ticket => valid_attributes, :actions => { :event => "" }
          response.should redirect_to(ticket_url(ticket))
        end
      end

      describe "with invalid params" do
        it "assigns the ticket as @ticket" do
          ticket = Ticket.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Ticket.any_instance.stub(:save).and_return(false)
          put :update, :id => ticket.id.to_s, :ticket => {}, :actions => { :event => "" }
          assigns(:ticket).should eq(ticket)
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested ticket" do
        ticket = Ticket.create! valid_attributes
        expect {
          delete :destroy, :id => ticket.id.to_s
        }.to change(Ticket, :count).by(-1)
      end

      it "redirects to the tickets list" do
        ticket = Ticket.create! valid_attributes
        delete :destroy, :id => ticket.id.to_s
        response.should redirect_to(tickets_url)
      end
    end
  end
end

class AddressesController < ApplicationController
    def new
        @address = Address.new
    end

    def create
        @address = current_user.addresses.create(address_params)
        respond_to do |format|
            if @address.save
                format.js
            end
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def address_params
        params.require(:address).permit(:full_name, :mobile_number, :pincode, :house_no, :area, :landmark, :city, :state, :address_type)
    end

    def set_variable
        @address = Address.find(param[:id])
    end

end

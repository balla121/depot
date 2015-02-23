require "rails_helper"

RSpec.describe Product, :type => :model do

  describe "Product model" do
    def new_product(image_url)
      Product.new(title: "My Book Title",
                  description: "yyy",
                  price: 1,
                  image_url: image_url)
    end

    describe "Product model validation"  do
      describe "product attributes must not be empty" do
        product = Product.new
        it "produces an invalid product" do
          expect(product).to be_invalid
        end

        it "produces a title error" do
          expect(product.errors[:title]).not_to be_empty
        end

        it "produces a description error" do
          expect(product.errors[:description]).not_to be_empty
        end

        it "produces a price error" do
          expect(product.errors[:price]).not_to be_empty
        end

        it "produces a image_url error" do
          expect(product.errors[:image_url]).not_to be_empty
        end

      end
    end

    describe "product price must be positive" do
      product = Product.new(title: "My Book Title",
                            description: "yyy",
                            image_url: "zzz.jpg")
      describe "when the product price is negative" do
        it "is invalid" do
          product.update(:price => -1)
          expect(product.errors[:price]).not_to be_empty
        end
      end

      describe "when product price is 0" do
        it "is invalid" do
          product.update(:price => 0)
          expect(product.errors[:price]).not_to be_empty
        end
      end

      describe "when product price is 1" do
        it "is valid" do
          product.update(:price => 1)
          expect(product.errors[:price]).to be_empty
        end
      end

    end

    describe "image url validity" do
      ok = %w{ fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif fred.gif}
      bad = %w{ fred.doc fred.gif/more fred.gif.more}
      it "good images" do
        ok.each do |name|
          expect(new_product(name)).to be_valid, "#{name} should be valid"
        end
      end
      it "bad image" do
        bad.each do |name|
          expect(new_product(name)).to be_invalid "#{name} should not be valid"
        end
      end
    end

    describe "product is not valid without a unique title" do
      it "is invalid" do

      end
    end

  end
end

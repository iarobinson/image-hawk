# ImageHawk

[www.imagehawk.app](https://www.imagehawk.app)

ImageHawk is a place to sell your photography online.

The idea was born while surfing in Costa Rica. A surf photographer took some photos of me and he sold them to me. This application would have made that purchasing experience easier.

## How It Works

The photographer takes photos of people surfing. He brings with him a sign that says: `Find me on ImageHawk.app/username`. He uploads the high resolution images to his ImageHawk account. The images are displayed as low resolution photos to the buyer. Once the surfer/buyer purchases the images, they are sent the high-resolution photos immediately.

# Tech

Keep it simple!

- Ruby on Rails (ActionStorage)
- Bootstrap 5 - Currenly just added with CDN link
- Stripe for payment processing

# Local Development

This is a typical rails application:
`git clone`
`cd image-hawk`
`rails db:migrate`
`rails s`
and navigate in the browser to `localhost:3000`

# Testing

For standard tests: `rails test`
For cucumber tests: `cucumber`

# Thanks

- [Custom Error Pages Guide](https://web-crunch.com/posts/custom-error-page-ruby-on-rails)
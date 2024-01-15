const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    email: {
        type: String,
        required: true,
        trim: true,
        validate: {
            validator: (value) => {
                const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return value.match(re);
            },
            message: 'Please enter a valid email address!'
        }
    },
    password: {
        type: String,
        required: true,
        unique: true,
        validate: {
            validator: (value) => {
                return value.length > 6;
            },
            message: 'Please enter a password having length greater than 6!'
        },

    },
    address: {
        type: String,
        default: '',
    },
    type: {
        type: String,
        default: 'user',
    },
    // cart
});

// User model giving it the name of 'User' and providing it the schema of userSchema which we just defined above!
const User = mongoose.model('User', userSchema);
module.exports = User;
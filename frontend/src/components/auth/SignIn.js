import React, { Component } from 'react'

export class SignIn extends Component {
    state = {
        username: '',
        password: ''
    }

    handleSubmit = e => {
        e.preventDefault()
        this.setState({
            username: '',
            password: ''
        })
    }

    handleChange = e => {
        this.setState({
            [e.target.name]: e.target.value
        })
    }


    render() {
        return (
            <div>
                <h2>Sign In</h2>
                <form className = "Sign_In_Form" onSubmit ={this.handleSubmit}>
                    <label htmlFor="username">Username</label>
                    <input type = 'text' id='username' name='username' value = {this.state.username} onChange = {this.handleChange} placeholder = "enter username"/>
                    <label htmlFor="password">Password</label>
                    <input type ='password' id='password' name='password' value = {this.state.password} onChange = {this.handleChange} placeholder='enter password'/>
                    <button type= "submit">Sign In</button>
                </form>
            </div>
        )
    }
}

export default SignIn

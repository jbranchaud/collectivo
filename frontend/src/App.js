import React, { Component } from "react";
import logo from "./logo.svg";
import "./App.css";
import "whatwg-fetch";

import { reduxForm, Field } from "redux-form";

const InputField = ({ input, label, type }) => {
  return (
    <div>
      <label htmlFor={input.name}>
        {label}
      </label>
      <div>
        <input {...input} id={input.name} />
      </div>
    </div>
  );
};

let SignInForm = ({ handleSubmit }) => {
  return (
    <form onSubmit={handleSubmit}>
      <Field
        type="text"
        component={InputField}
        name="signin[email]"
        label="Email"
      />
      <Field
        type="password"
        component={InputField}
        name="signin[password]"
        label="Password"
      />
      <button type="submit">Sign in</button>
    </form>
  );
};

SignInForm = reduxForm({
  form: "signIn"
})(SignInForm);

class App extends Component {
  handleSignIn(values) {
    const request = {
      method: "POST",
      // uncommenting the below lines will set the content type but break
      // the fetch :(
      // headers: {
      //   "Content-Type": "application/json"
      // },
      body: JSON.stringify(values.signin)
    };

    fetch("http://localhost:4444/api/session", request)
      .then(function(response) {
        return response.json();
      })
      .then(function(response) {
        console.log(response);
      })
      .catch(function(error) {
        console.log(error);
      });
  }
  render() {
    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Elixir-React Integration</h2>
        </div>
        <p className="App-intro">Sign in to your account here</p>
        <SignInForm onSubmit={this.handleSignIn} />
      </div>
    );
  }
}

export default App;

import React from 'react';
import { Link, Redirect } from 'react-router-dom';
import axios from 'axios';
import { Card, Form, Input, Button, Error } from '../components/AuthForm';
import { useAuth } from "../context/auth";

function Signup() {
    const [isSignedUp, setSignedUp] = useState(false);
    const [isError, setIsError] = useState(false);
    const [userName, setUserName] = useState("");
    const [password, setPassword] = useState("");
    const [passwordRepeat, setPasswordRepeat] = useState("");
    const { setAuthTokens } = useAuth();

    function postSignup() {
        if (password === passwordRepeat) {
            axios.post(
                "http://www.TwoTaverns.com/auth/signup", { userName, password }
            ).then(result => {
                if (result.status === 200) {
                    setAuthTokens(result.data);
                    setSignedUp(true);
                } else {
                    setIsError(true);
                }
            }).catch(e => {
                setIsError(true);
            });
        } else {
            setIsError(true);
        }
    }

    function handleErrors() {
        if (password === passwordRepeat) {
            return `${ isError && <Error>Passwords must match</Error> }`
        } else if (isError) {
            return `${ isError && <Error>Username already exists</Error>}`
        }
    }

    if (isSignedUp) {
        return <Redirect to="/" />
    }

    return (
        <Card>
            <Form>
                <Input
                    type="username"
                    value={userName}
                    onChange={e => {
                        setUserName(e.target.value);
                    }}
                    placeholder="email" 
                />
                <Input
                    type="password"
                    value={password}
                    onChange={e => {
                        setPassword(e.target.value);
                    }}
                    placeholder="password"
                />
                <Input
                    type="password"
                    value={passwordRepeat}
                    onChange={e => {
                        setPasswordRepeat(e.target.value);
                    }}
                    placeholder="repeat password"
                />
                <Button onClick={postSignup}>Create an Account</Button>
            </Form>
            <Link to="/login">Have an account?</Link>
            {this.handleErrors()}
        </Card>
    );
}

export default Signup;
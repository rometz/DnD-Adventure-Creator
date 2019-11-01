import React from 'react';
import { Link } from 'react-router-dom';
import { Card, Form, Input, Button } from '../components/AuthForm';

function Signup() {
    return (
        <Card>
            <Form>
                <Input type="email" placeholder="email" />
                <Input type="password" placeholder="password" />
                <Input type="password" placeholder="password" />
                <Button>sign up</Button>
            </Form>
            <Link to="/login">Already have an account?</Link>
        </Card>
    );
}

export default Signup;
// Node libraries
import { Route, Routes } from "react-router-dom";

import {
    Register,
    Login,
    Home,
    PostPage,
    User,
    Overview,
    GetPost,
    ErrorPage,
    Wrapper,
} from "./Imports.ts";

// CSS
import "./App.scss";

import UserContextProvider from "./components/ContextProvider.tsx";

function App() {
    return (
        <UserContextProvider>
            <Wrapper>
                <Routes>
                    <Route path="/user/">
                        <Route path=":id" element={<User />} />
                        <Route path="" element={<ErrorPage code={404} />} />
                    </Route>
                    <Route path="/post/">
                        <Route path=":id" element={<GetPost />} />
                        <Route path="" element={<PostPage />} />
                    </Route>
                    <Route path="overview" element={<Overview />} />
                    <Route path="login" element={<Login />} />
                    <Route path="register" element={<Register />} />
                    <Route path="/" element={<Home />} />
                    <Route path="*" element={<ErrorPage code={404} />} />
                </Routes>
            </Wrapper>
        </UserContextProvider>
    );
}

export default App;

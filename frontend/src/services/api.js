import axios from 'axios';

//const API_URL = 'https://flask-production-f285.up.railway.app';
const API_URL = 'http://127.0.0.1:5000';
// Create an Axios instance with default headers
const axiosInstance = axios.create({
    baseURL: API_URL,
});

// Add a request interceptor to include the JWT token in the headers
axiosInstance.interceptors.request.use(
    function (config) {
        const token = localStorage.getItem('jwtToken');
        if (token) {
            config.headers.Authorization = `Bearer ${token}`;
        }
        return config;
    },
    function (error) {
        return Promise.reject(error);
    }
);

export function get(url) {
    return axiosInstance.get(url)
        .then(response => response.data)
        .catch(error => {
            throw error;
        });
}

export function post(url, data) {
    return axiosInstance.post(url, data)
        .then(response => response.data)
        .catch(error => {
            throw error;
        });
}

export function put(url, data) {
    return axiosInstance.put(url, data)
        .then(response => response.data)
        .catch(error => {
            throw error;
        });
}

export function remove(url) {
    return axiosInstance.delete(url)
        .then(response => response.data)
        .catch(error => {
            throw error;
        });
}
import axios from 'axios';
import env from '../../env';
//If the headers are reusable across multiple functions or components,
// defining them in the axiosConfig centralizes the configuration,
// making it easier to maintain and update.
const axiosInstance = axios.create({
  baseURL: env.BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

axiosInstance.interceptors.request.use(
  config => {
    console.log('Starting request', config);
    return config;
  },
  error => {
    console.error('Error:', error);
    return Promise.reject(error);
  },
);

axiosInstance.interceptors.response.use(
  response => {
    console.log('Response:', response);
    return response;
  },
  error => {
    console.error('Error:', error);
    return Promise.reject(error);
  },
);

// if (error.response) {
//   // The request was made and the server responded with a status code
//   // that falls out of the range of 2xx
//   console.log(error.response.data);
//   console.log(error.response.status);
//   console.log(error.response.headers);
// } else if (error.request) {
//   // The request was made but no response was received
//   // `error.request` is an instance of XMLHttpRequest in the browser and an instance of
//   // http.ClientRequest in node.js
//   console.log(error.request);
// } else {
//   // Something happened in setting up the request that triggered an Error
//   console.log('Error', error.message);
// }
export default axiosInstance;

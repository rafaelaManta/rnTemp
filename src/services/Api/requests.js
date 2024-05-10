import axiosInstance from './config';

async function get(endpoint) {
  // const headers = {
  //   Authorization: 'Bearer YOUR_TOKEN',
  //   'Content-Type': 'application/json',
  // };

  try {
    // If headers need to be dynamically generated based on certain conditions or user inputs,
    // it makes sense to create them within the fetchData function.
    // await axiosInstance.get(`/${endpoint}`,headers);
    const response = await axiosInstance.get(`/${endpoint}`);
    return response.data;
  } catch (error) {
    console.error('Error fetching data:', error);
    throw new Error(error);
  }
}

async function post(endpoint, payload) {
  try {
    const response = await axiosInstance.post(`/${endpoint}`, payload);
    return response.data;
  } catch (error) {
    console.error('Error creating post:', error);
    throw new Error(error);
  }
}

async function deleteRequest(endpoint, payloadToDelete) {
  try {
    const response = await axiosInstance.delete(
      `/${endpoint}/${payloadToDelete}`,
    );
    return response.data;
  } catch (error) {
    console.error('Error creating post:', error);
    throw new Error(error);
  }
}

export {post, get, deleteRequest};

/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  exportPathMap: function () {
    return {
      '/': { page: '/login' },
    };
  },
}

module.exports = nextConfig

module.exports = function (api) {
  const validEnv = ['development', 'test', 'production'];
  const currentEnv = api.env();
  const isDevelopmentEnv = api.env('development');
  const isProductionEnv = api.env('production');
  const isTestEnv = api.env('test');

  if (!validEnv.includes(currentEnv)) {
    throw new Error(
      `Please specify a valid 'NODE_ENV' or 'BABEL_ENV' environment variables. Valid values are "development", "test", and "production". Instead, received: ${JSON.stringify(currentEnv)}.`
    );
  }

  const presets = [];
  const plugins = [
    'babel-plugin-macros',
    '@babel/plugin-syntax-dynamic-import',
    '@babel/plugin-transform-destructuring',
    [
      '@babel/plugin-proposal-class-properties',
      {
        loose: true,
      },
    ],
    [
      '@babel/plugin-proposal-object-rest-spread',
      {
        useBuiltIns: true,
      },
    ],
    [
      '@babel/plugin-transform-runtime',
      {
        helpers: false,
        regenerator: true,
        corejs: false,
      },
    ],
    [
      '@babel/plugin-transform-regenerator',
      {
        async: false,
      },
    ],
  ];

  if (isTestEnv) {
    presets.push([
      '@babel/preset-env',
      {
        targets: {
          node: 'current',
        },
      },
    ]);
    plugins.push('babel-plugin-dynamic-import-node');
  }

  if (isProductionEnv || isDevelopmentEnv) {
    presets.push([
      '@babel/preset-env',
      {
        forceAllTransforms: true,
        useBuiltIns: 'entry',
        corejs: 3,
        modules: false,
        exclude: ['transform-typeof-symbol'],
      },
    ]);
  }

  return {
    presets,
    plugins,
  };
};
